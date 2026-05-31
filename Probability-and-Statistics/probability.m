N = 1000;
coin = randi([0 1],1,N);
p_head = sum(coin==1)/N

dice = randi([1 6],1,N);
histogram(dice)