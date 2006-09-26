Received: from [66.249.82.224] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GSDO7-0006El-VB
	for openembedded-devel@openembedded.org; Tue, 26 Sep 2006 15:54:21 +0200
Received: by wx-out-0506.google.com with SMTP id s19so2277676wxc
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Sep 2006 06:49:31 -0700 (PDT)
Received: by 10.70.18.11 with SMTP id 11mr768582wxr;
	Tue, 26 Sep 2006 06:49:30 -0700 (PDT)
Received: from CUBE ( [82.193.96.236])
	by mx.gmail.com with ESMTP id r9sm3124080nza.2006.09.26.06.49.29;
	Tue, 26 Sep 2006 06:49:30 -0700 (PDT)
Date: Tue, 26 Sep 2006 16:49:29 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1784392143.20060926164929@gmail.com>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
In-Reply-To: <4519283E.5010001@dominion.kabel.utwente.nl>
References: <4518B426.6070905@mitac-mtc.com.tw>
	<1159265456.18705.53.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<4519283E.5010001@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: Failed to build gpe-image ( mainstone/generic )
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 13:54:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Tuesday, September 26, 2006, 4:16:46 PM, you wrote:

[]

> Is anybody still using dbus 0.23.x in .dev? I'd like to move it to packages/obsolete/dbus
> to avoid people falling in this trap over and over again. D-bus 1.0 (with a stable API) is
>  going to be released soon(TM), so people should really adapt their apps to the 0.9x (and
> thus 1.0) API.

  Thanks for moving it away, but not removing. I'd still like to work
on migration path for Familiar, and 0.8.4 uses 0.23.

> regards,

> Koen

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



