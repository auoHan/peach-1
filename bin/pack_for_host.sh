# 注意修改 oh-my-env 目录名为你的目录名
dir=oh-my-env

time=$(date +'%Y%m%d-%H%M%S')
dist=tmp/peach-$time.tar.gz
current_dir=$(dirname $0)
deploy_dir=/workspaces/$dir/peach_deploy

yes | rm tmp/peach-*.tar.gz; 
yes | rm $deploy_dir/peach-*.tar.gz; 



tar --exclude="tmp/cache/*" -czv -f $dist *
mkdir -p $deploy_dir
cp $current_dir/../config/host.Dockerfile $deploy_dir/Dockerfile
cp $current_dir/setup_host.sh $deploy_dir/
mv $dist $deploy_dir
echo $time > $deploy_dir/version
echo 'DONE!'