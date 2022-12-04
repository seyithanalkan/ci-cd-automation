job('seed_job') {
  scm {
    git {
      remote {
        url('https://github.com/seyithanalkan/ci-cd-automation.git')
      }
      branch('master')
    }
  }
   triggers {
            scm('*/5 * * * *')
        }
  steps {
    shell('echo "Alkan, Seyit Han" ')
    shell('sh "Jenkins/build.sh" ')
  }
}
