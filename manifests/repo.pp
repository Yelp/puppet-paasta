class paasta::repo {

  apt::source { 'paasta':
    location          => 'https://dl.bintray.com/yelp/paasta',
    release           => $::lsbdistcodename,
    key               => {
      id     => '8756C4F765C9AC3CB6B85D62379CE192D401AB61',
      server => 'keyserver.ubuntu.com',
    },
    repos             => 'main',
    include_src       => false,
  }
}
