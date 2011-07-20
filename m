Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QjSy0-0005YQ-H7
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 11:21:20 +0200
Received: from nvs0066 ([10.91.8.1]) by smtp.nedap.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 20 Jul 2011 11:17:10 +0200
X-TM-IMSS-Message-ID: <23c4586a00010928@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 23c4586a00010928 ;
	Wed, 20 Jul 2011 11:16:34 +0200
Message-ID: <4E269D1F.9070009@nedap.com>
Date: Wed, 20 Jul 2011 11:17:19 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 20 Jul 2011 09:17:10.0743 (UTC)
	FILETIME=[CE194E70:01CC46BD]
Subject: best practice .inc files
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
X-List-Received-Date: Wed, 20 Jul 2011 09:21:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I was wondering what the best way is to do this.

I'm using the 2010.12 release.
I've created my own u-boot_2010.09.bb file in my local repository.
In it is aline
     require u-boot.inc
(every u-boot*.bb recipe has it)
Now I need a copy of the openembedded/recipes/u-boot/u-boot.inc in my 
local repository to get it bitbaked.
(Well actually I've symlinked the file)
I think both solutions are not optimal.
Is there a way to this in a more gentle way?

Thanks!
Jaap




