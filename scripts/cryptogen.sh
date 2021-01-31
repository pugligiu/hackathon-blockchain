
echo 'Cryptogen Starts';
ls -l /shared/artifacts;

while [ ! -d /shared/artifacts ];
do
  echo Waiting for configFiles;
  sleep 1;
done;

cryptogen generate --config /shared/artifacts/crypto-config.yaml \
  && cp -r crypto-config /shared/ \
  && for file in $(find /shared/ -iname *_sk);

do echo $file;

dir=$(dirname $file);
echo ${dir};
mv ${dir}/*_sk ${dir}/key.pem;
done && find /shared -type d | xargs chmod a+rx && find /shared -type f | xargs chmod a+r && touch /shared/status_cryptogen_complete;
