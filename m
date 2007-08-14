Received: from [63.139.215.200] (helo=SNEEZY.RUSSOUND.COM)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <jims@RUSSOUND.COM>) id 1IKz32-0003qf-66
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2007 18:15:12 +0200
Received: from [10.0.3.92] ([10.0.3.92]) by SNEEZY.RUSSOUND.COM with Microsoft
	SMTPSVC(6.0.3790.3959); Tue, 14 Aug 2007 12:13:03 -0400
Message-ID: <46C1D4A6.8090506@russound.com>
Date: Tue, 14 Aug 2007 12:13:26 -0400
From: Jim Sheldon <jims@russound.com>
User-Agent: Thunderbird 1.5.0.12 (X11/20070604)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <8852460a0708140740r4eca93ddhb9d04b7e506ae010@mail.gmail.com>
In-Reply-To: <8852460a0708140740r4eca93ddhb9d04b7e506ae010@mail.gmail.com>
X-OriginalArrivalTime: 14 Aug 2007 16:13:03.0902 (UTC)
	FILETIME=[FE2633E0:01C7DE8D]
Subject: Re: BitBake Compilation errors
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
X-List-Received-Date: Tue, 14 Aug 2007 16:15:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

What do your $PATH and $BBPATH variables look like?

Vamsi wrote:
> Hi All,
> 
> 
>  I followed the steps as mentioned in the GettingStarted and was
> trying to build with bitbake as "bitbake nano" but I am getting in to
> this error.
>  Is there any specific versions of the software that I should be using ?
>  Any help to resolve the following issue would be appreciated. I am
> new to Linux environment
> 
>   File "/home/ubuntu/MyDesk/oe/bitbake-1.8/bin/bitbake", line 134, in ?
>     main()
>   File "/home/ubuntu/MyDesk/oe/bitbake-1.8/bin/bitbake", line 114, in main
>     cooker = bb.cooker.BBCooker(configuration)
>   File "/home/ubuntu/MyDesk/oe/bitbake-1.8/lib/bb/cooker.py", line 65,
> in __init__
>     self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>   File "/home/ubuntu/MyDesk/oe/bitbake-1.8/lib/bb/cooker.py", line
> 340, in parseConfigurationFile
>     bb.fetch.fetcher_init(self.configuration.data)
>   File "/home/ubuntu/MyDesk/oe/bitbake-1.8/lib/bb/fetch/__init__.py",
> line 97, in fetcher_init
>     pd.delDomain("BB_URI_HEADREVS")
>   File "bitbake-1.8/lib/bb/persist_data.py", line 66, in delDomain
> AttributeError: 'pysqlite2.dbapi2.Connection' object has no attribute 'execute'
> r
> 
> 
> Thanks,
> Vamsi
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


