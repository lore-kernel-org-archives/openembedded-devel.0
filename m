Received: from [209.85.219.223] (helo=mail-ew0-f223.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MWqb4-0000fv-SY
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Jul 2009 13:48:28 +0200
Received: by ewy23 with SMTP id 23so1374141ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2009 04:33:18 -0700 (PDT)
Received: by 10.210.38.5 with SMTP id l5mr720323ebl.99.1249039998380;
	Fri, 31 Jul 2009 04:33:18 -0700 (PDT)
Received: from ?192.168.1.64? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 28sm37777eye.14.2009.07.31.04.33.17
	(version=SSLv3 cipher=RC4-MD5); Fri, 31 Jul 2009 04:33:17 -0700 (PDT)
Message-ID: <4A72D676.6060304@xora.org.uk>
Date: Fri, 31 Jul 2009 12:33:10 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A6FD077.1060001@gmail.com>	<h4ou1e$s42$1@ger.gmane.org>	<4A700A74.7040507@xora.org.uk>	<200907291131.04967.marcin@juszkiewicz.com.pl>	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>	<20090730053353.GF25691@smtp.west.cox.net>	<6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>	<4A7160F2.8030000@xora.org.uk>	<4A7255D3.9020703@gmail.com>	<4A729943.4060200@xora.org.uk>
	<4A729FF4.3040600@gmail.com>
In-Reply-To: <4A729FF4.3040600@gmail.com>
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Fri, 31 Jul 2009 11:48:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> Graeme Gregory wrote:
>> Looks good to me, do you fancy moving that do_compile_append into 
>> kernel.bbclass? You can then have the added kudos of fixing OE core 
>> files :-)
>
> Kudos sound tasty.
>
Thanks for your hard work, have now applied to OE.

Graeme



