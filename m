Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1S2gHQ-0001lH-Cm
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 10:57:04 +0100
Received: by bkcjg15 with SMTP id jg15so3262594bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 01:48:36 -0800 (PST)
Received-SPF: pass (google.com: domain of koansoftware@gmail.com designates
	10.204.145.81 as permitted sender) client-ip=10.204.145.81; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of koansoftware@gmail.com
	designates 10.204.145.81 as permitted sender)
	smtp.mail=koansoftware@gmail.com;
	dkim=pass header.i=koansoftware@gmail.com
Received: from mr.google.com ([10.204.145.81])
	by 10.204.145.81 with SMTP id c17mr11708847bkv.39.1330508916069
	(num_hops = 1); Wed, 29 Feb 2012 01:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:organization:user-agent:mime-version
	:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=dQP+sDSk2MjsRo9Lyz1KjIEFDW2iUZW5w6QTxJv0BrQ=;
	b=kbn/qZA0rYVvAYqqiRufHpY9uGgmhp3Psa4uMvYAucS0Dc03ro6vXQfRKfNmscisHZ
	4uUaUslYCRSO/nVFPyk05FEmfn/zuG7OrfTQksepRmllq6oGMvIHJbCzJrzhb1dnpJmY
	1F9nLQzKp3kJEmBr/qBFi5p2nLcW844sUDsrQ=
Received: by 10.204.145.81 with SMTP id c17mr9488369bkv.39.1330508915978;
	Wed, 29 Feb 2012 01:48:35 -0800 (PST)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id jc4sm36201908bkc.7.2012.02.29.01.48.33
	(version=SSLv3 cipher=OTHER); Wed, 29 Feb 2012 01:48:34 -0800 (PST)
Message-ID: <4F4DF470.1090202@gmail.com>
Date: Wed, 29 Feb 2012 10:48:32 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F4A68FE.2020109@gmail.com>
	<20120226183711.312b7e58@eb-e6520>	<4F4B5938.7000908@gmail.com>
	<20120227114719.4a9540fb@eb-e6520>
In-Reply-To: <20120227114719.4a9540fb@eb-e6520>
Subject: Re: angstrom site down, where to find mirrors
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
X-List-Received-Date: Wed, 29 Feb 2012 09:57:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Eric Bénard ha scritto, Il 27/02/2012 11:47:
> Hi Marco,
> 
>> Where alre defined the URLs used by "angstrom-mirrors" ?
>>
> meta-angstrom/classes/angstrom-mirrors.bbclass


In case of do_fetch errors with Openembedded you can find some sources
here too:
http://sourceforge.net/projects/kaeilos/

HTH

Cordiali Saluti / Kindest Regards / Mit freundlichen Grüßen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


