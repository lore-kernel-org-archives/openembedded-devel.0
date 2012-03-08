Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1S5Yrz-0005DL-UQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 09:38:44 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B8ADA2232636;
	Thu,  8 Mar 2012 09:30:07 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6C4262232635;
	Thu,  8 Mar 2012 09:30:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225007197.adsl.alicedsl.de
	[92.225.7.197]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Thu,  8 Mar 2012 09:30:06 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 79F653C4B9; Thu,  8 Mar 2012 09:30:04 +0100 (CET)
Date: Thu, 8 Mar 2012 09:30:04 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: "Eibach, Dirk" <Eibach@gdsys.de>
Message-ID: <20120308083003.GA3376@rhein.zuhause.netz>
References: <48D3D52125C49B43AE880038E2E5314BB5BFAB@SRV101.gdsys.de>
MIME-Version: 1.0
In-Reply-To: <48D3D52125C49B43AE880038E2E5314BB5BFAB@SRV101.gdsys.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] Compiling log4j1.2-native fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2012 08:38:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 08, 2012 at 09:13:37AM +0100, Eibach, Dirk wrote:
> 
> With latest git of meta-java compiling log4j1.2-native-1.2.15-r0 fails
> while building openjdk-6, main problem seems to be:
> 
> | 32. ERROR in src/main/java/org/apache/log4j/net/SMTPAppender.java (at
> line 1)
> | 	/*
> | 	^
> | The type javax.mail.MessagingException cannot be resolved. It is
> indirectly referenced from required .class files
> 
> Any ideas?
> 
> Cheers
> Dirk

Hi,

I never before saw this problem. What did you choose as java-native compiler?

Bye Henning


