Received: from mail.geicp.com ([203.206.162.107])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gbj@theforce.com.au>) id 1Necpb-0003tf-2O
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 00:15:54 +0100
Received: from [192.168.0.8] (bwing.geicp.com [192.168.0.8])
	(authenticated bits=0)
	by mail.geicp.com (8.14.3/8.14.3/Debian-6) with ESMTP id o18NDFjZ007125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Feb 2010 10:13:16 +1100
Message-ID: <4B709A8A.6000402@theforce.com.au>
Date: Tue, 09 Feb 2010 10:13:14 +1100
From: Grahame Jordan <gbj@theforce.com.au>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B6B4EBC.1030906@theforce.com.au>	<1265356132.3907.12.camel@mattotaupa>	<4B6F3274.2010508@theforce.com.au>
	<19c1b8a91002071832u5d5c3efcxf5bc2a572cfb1e1a@mail.gmail.com>
In-Reply-To: <19c1b8a91002071832u5d5c3efcxf5bc2a572cfb1e1a@mail.gmail.com>
X-geicp-MailScanner-ID: o18NDFjZ007125
X-geicp-MailScanner: Found to be clean
X-geicp-MailScanner-From: gbj@theforce.com.au
X-SA-Exim-Connect-IP: 203.206.162.107
X-SA-Exim-Mail-From: gbj@theforce.com.au
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: mtr
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
X-List-Received-Date: Mon, 08 Feb 2010 23:15:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


I am using glibc, maybe I could try a uclibc build

Thanks
> are you using uclibc ? if yes then you can get along this error by adding
> UCLIBC_HAS_LIBRESOLV_STUB=y to uClibc.distro file. If its glibc/eglibc then
> there should be some issue with the configure test of mtr.
>
> Thx
>
> -Khem
>   


