fun FijRecursive(x,y) = 
    if(x=0 andalso y=0) then 0
    else if (x > 0) then(
            if(y>=0) then(
                if(x>y) then FijRecursive(x,y+1) + 1
                else FijRecursive(x-1,y) + 1
            )
            else if(x>=(~y)) then FijRecursive(x,y+1) + 1
            else FijRecursive(x+1,y) + 1
    )
    else if(y>=0) then(
            if(y > (~x)+1) then FijRecursive(x-1,y) + 1
            else FijRecursive(x,y-1) + 1
    )
    else if((~x)>(~y)) then FijRecursive(x,y-1) + 1
    else FijRecursive(x+1,y) + 1

fun summationdouble(n) = n*(n+1)

fun FijAnalytical(x,y) = 
    if(x=0 andalso y=0) then 0
    else if (x >= 0) then(
            if(y>=0) then(
                if(x>=y) then summationdouble(2*x-1)+(x-y)
                else summationdouble(2*y-1)-(y-x)
            )
            else if(x>=(~y)) then ((2*x)*(2*x))-(x-(~y))
            else ((2*y)*(2*y))+((~y)-x)
    )
    else if(y>0) then(
            if(y >= (~x)+1) then ((2*y-1)*(2*y-1))+(y-(~x)-1)
            else ((2*(~x)+1)*(2*(~x)+1))-((~x)-y+1)
    )
    else if((~x)>=(~y)) then summationdouble(2*(~x))+((~x)-(~y))
    else summationdouble(2*(~y))-((~y)-(~x))

fun addPairs (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

fun cover(s,n,di,l,i,j) = 
        if(s = n ) then (i,j)
        else if(n-s>2*l) then(
                if(di = 0) then cover(s+2*l,n,1,l+1,i-l,j-l)
                else cover(s+2*l,n,0,l+1,i+l,j+l)     
        )
        else if(di = 0) then(
                if(n-s>l) then (i-(n-l-s),j-l)
                else (i,j-(n-s))
        )
        else if(n-s>l) then (i+(n-s-l),j+l)
        else (i,j+(n-s))

fun FkRecursive(k) = 
        cover(0,k,1,1,0,0)

fun FkAnalytical(k) = 
        let 
                val lower = floor(Math.sqrt(Real.fromInt(k)))
                val dis = (lower+1) div 2
                val a = 4*dis*dis
                val b = (2*dis -1) * (2*dis -1)
                val nb = (2*dis +1) * (2*dis +1)
        in
                if( k <= a+(2*dis) andalso k>= a - (2*dis)) then(
                        if( k > a ) then addPairs (dis,~(dis)) (~(k-a),0)
                        else addPairs (dis,~(dis)) (0,a-k)
                )
                else if( k <= b+(2*dis-1) ) then addPairs (~(dis-1),dis) (k-b,0)
                else addPairs (~(dis),dis+1) (0,~(nb-k))
        end