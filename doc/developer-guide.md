### Run generator
```
dart run build_runner build --delete-conflicting-outputs
```


## Releases

### Fastforge (Deb, RPM, AppImage)

#### Release all
```
fastforge release --name production
```

#### Target a specific release
```
fastforge package --platform linux --target rpm
```

#### RPM Build errors on Ubuntu
```
echo "%_dbpath %{_usrsrc}/rpm/db" >> ~/.rpmmacros
```