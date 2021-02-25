# a million commits
for Y in {2019..2019}
do
  mkdir $Y
  cd $Y
  for M in {12..12}
  do
    mkdir $M
    cd $M
    for D in {1..31}
    do
      Base=2
      if [ $(( ( ( D - Base ) % 7 ) )) -eq 0 ] || [ $(( ( ( D - Base ) % 7 ) )) -eq 1 ] || [ $(( ( ( D - Base ) % 7 ) )) -eq 2 ] || [ $(( ( ( D - Base ) % 7 ) )) -eq 3 ] || [ $(( ( ( D - Base ) % 7 ) )) -eq 4 ]
      then
        if [ $(( ( RANDOM % 10 )  + 1 )) -eq 3 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 4 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 5 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 7 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 8 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 9 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 2 ]
        then
          mkdir $D
          cd $D
          for i in {1..8}
          do
            if [ $(( ( RANDOM % 10 )  + 1 )) -eq 3 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 4 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 5 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 7 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 8 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 9 ] || [ $(( ( RANDOM % 10 )  + 1 )) -eq 2 ]
            then  
              echo "$i on $M/$D/$Y" > commit.md
              export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00"
              export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00"
              git add commit.md -f
              git commit --date="$Y-$M-$D 12:0$i:00" -m "$i on $M $D $Y"         
            fi
          done
          cd ../
        fi
      fi
    done
    cd ../
  done
  cd ../
done
git push origin master
git rm -rf 20**
git rm -rf 19**
git commit -am "cleanup"
git push origin master
