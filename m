Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RFuPJ-0003OB-Qn
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 23:07:37 +0200
Received: from iph3.telenor.se (iph3.telenor.se [195.54.127.134])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id F3255EA66E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 23:01:43 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AngkAKSWnE5T4zkNPGdsb2JhbAAMN5lyjnoBAQEBN4IgAQEBAQMBAQE1NgoRCyEWDwkDAgECARUBGxQTBgIBAYgDtzaICASRYIIakVY
X-IronPort-AV: E=Sophos;i="4.69,361,1315173600"; d="scan'208";a="132380286"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph3.telenor.se with ESMTP; 17 Oct 2011 23:01:43 +0200
Message-ID: <4E9C97B7.6010607@telia.com>
Date: Mon, 17 Oct 2011 23:01:43 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CACphT6KqgRkRt1vtfS8ROS5P36P=yKACX0tNV6gw7NTa25U9Bg@mail.gmail.com>
In-Reply-To: <CACphT6KqgRkRt1vtfS8ROS5P36P=yKACX0tNV6gw7NTa25U9Bg@mail.gmail.com>
Subject: Re: Openssl build bug
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
X-List-Received-Date: Mon, 17 Oct 2011 21:07:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-10-17 22:46, Panda Resistor skrev:
> Openssl-native_1.0.0d-r14 will not build on Ubuntu 11.10, but is building on
> Ubuntu 10.04. The errors are undefined reference errors, and it has been
> suggested that they are linked to erroneous ordering of library dependencies
> and dependency folders, however the libdepsfirst patch has been applied by
> bitbake upon a compilation attempt.
>
> Cheers
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I can confirm that I see the same.
Builds on 11.04, but not on 11.10.

-- 
Best Regards
Ulf Samuelsson



