Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbjnN-0007ry-Pg
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 03:42:25 +0200
Received: by pwi1 with SMTP id 1so580611pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=U8AUAR3IYLdFetzkIUyBj1M+CV3GrL+4PCxLSJI21D4=;
	b=cGjNxslN0hDnQzG6Ur9z4TRXTR+PYqgC7pcuYTAW9cMxWhYOq4n7pAh9WX8Ishsboj
	s+4C6wr7KxVOUxlAIJ7dR0tii3XawFRPGqg6oCMVXZs5ThxjGD9fGVuNILyfMNLHBlKP
	s9PKnPsgPYuKTPwZA0IS5gk0IAvPbCODBBZHY=
Received: by 10.68.34.101 with SMTP id y5mr334215pbi.139.1309311522893;
	Tue, 28 Jun 2011 18:38:42 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q5sm539120pbk.58.2011.06.28.18.38.42
	(version=SSLv3 cipher=OTHER); Tue, 28 Jun 2011 18:38:42 -0700 (PDT)
Message-ID: <4E0A8221.8070304@gmail.com>
Date: Tue, 28 Jun 2011 18:38:41 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <w4liwla3gm.wl%peter@chubb.wattle.id.au>	<4E0A7A7A.6040900@gmail.com>
	<w4ei2da142.wl%peter@chubb.wattle.id.au>
In-Reply-To: <w4ei2da142.wl%peter@chubb.wattle.id.au>
Subject: Re: gettext-native fails to build
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
X-List-Received-Date: Wed, 29 Jun 2011 01:42:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 06:16 PM, Peter Chubb wrote:
> Khem>  are you using oe.dev or oe-core ?  oe-core has these races
> Khem>  solved
>
> oe.dev.  I'll try again with the core branch.
>
FWIW here are my notes on how to use oe-core for angstrom

http://sakrah.homelinux.org/blog/2011/03/using-openembedded-core-to-build-angstrom-for-qemu/

-Khem


