Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pvamsikris@gmail.com>) id 1IKxZF-0006MQ-U6
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2007 16:40:23 +0200
Received: by ug-out-1314.google.com with SMTP id i24so86254ugd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2007 07:40:03 -0700 (PDT)
Received: by 10.66.249.8 with SMTP id w8mr671879ugh.1187102403343;
	Tue, 14 Aug 2007 07:40:03 -0700 (PDT)
Received: by 10.66.238.19 with HTTP; Tue, 14 Aug 2007 07:40:03 -0700 (PDT)
Message-ID: <8852460a0708140740r4eca93ddhb9d04b7e506ae010@mail.gmail.com>
Date: Tue, 14 Aug 2007 14:40:03 +0000
From: Vamsi <pvamsikris@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: BitBake Compilation errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2007 14:40:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,


 I followed the steps as mentioned in the GettingStarted and was
trying to build with bitbake as "bitbake nano" but I am getting in to
this error.
 Is there any specific versions of the software that I should be using ?
 Any help to resolve the following issue would be appreciated. I am
new to Linux environment

  File "/home/ubuntu/MyDesk/oe/bitbake-1.8/bin/bitbake", line 134, in ?
    main()
  File "/home/ubuntu/MyDesk/oe/bitbake-1.8/bin/bitbake", line 114, in main
    cooker = bb.cooker.BBCooker(configuration)
  File "/home/ubuntu/MyDesk/oe/bitbake-1.8/lib/bb/cooker.py", line 65,
in __init__
    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
  File "/home/ubuntu/MyDesk/oe/bitbake-1.8/lib/bb/cooker.py", line
340, in parseConfigurationFile
    bb.fetch.fetcher_init(self.configuration.data)
  File "/home/ubuntu/MyDesk/oe/bitbake-1.8/lib/bb/fetch/__init__.py",
line 97, in fetcher_init
    pd.delDomain("BB_URI_HEADREVS")
  File "bitbake-1.8/lib/bb/persist_data.py", line 66, in delDomain
AttributeError: 'pysqlite2.dbapi2.Connection' object has no attribute 'execute'
r


Thanks,
Vamsi


