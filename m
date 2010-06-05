Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1OKu8p-0004XJ-NI
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 16:14:28 +0200
Received: by fg-out-1718.google.com with SMTP id d23so772481fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=m3LFi+xeJK4cOwTSLhhKcuuCvNfuRbx79TGIf8b/uYY=;
	b=Vu5mQIrDL6siGZ+9y+vYeDgvqMLVFURxdeXnZ/bM3ounem1+iIRT8Ofmi5eg10VyiB
	xoNnAQUhqQ7cyQ+bkSiWfb9RJTZ18s+AdW9lRdqWJyDFESrnRMOkHJC1znSVnAtpMxTs
	lIWP4YyGA7io5gBhOdfPbG4KPqWyzc0jAo9/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=eWxN24Iw4zhauNGmuN0+FFJZQUfib14r1J5q6WqTuPRSgB492wGuho8m/LBk6t4K7H
	Nm1Sn16maWkm8LkbWQOOaZzpaQ8LO/pq8D5pFmJcF3ztHb1rCKTnBIvw15jlwNFryqXo
	zhVXHx4s5symIxDvX36HPVj0Kxoc0c9x+IlMA=
Received: by 10.87.15.40 with SMTP id s40mr19464708fgi.44.1275747011891;
	Sat, 05 Jun 2010 07:10:11 -0700 (PDT)
Received: from [192.168.5.27] (z0701.wist.uni-linz.ac.at [193.171.42.194])
	by mx.google.com with ESMTPS id 21sm3299641fks.23.2010.06.05.07.10.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Jun 2010 07:10:11 -0700 (PDT)
Message-ID: <4C0A5AC1.6060208@gmail.com>
Date: Sat, 05 Jun 2010 16:10:09 +0200
From: =?UTF-8?B?TWF0dGhpYXMgR8O8bnRoZXI=?= <matgnt@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C0992ED.6000102@gmail.com> <1275737144.1981.0.camel@saphir>
In-Reply-To: <1275737144.1981.0.camel@saphir>
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4 upgrade to 4.7.0-beta1
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
X-List-Received-Date: Sat, 05 Jun 2010 14:14:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 05.06.2010 13:25, Michael 'Mickey' Lauer wrote:
> Am Samstag, den 05.06.2010, 01:57 +0200 schrieb Matthias Günther:
>> Hello.
>>
>> I've been working with QML (Qt Quick) for some time now and therefore
>> I've created recipes for Qt 4.7.0-tp and beta1 versions. The patches
>> just disable the not cross compiling parts (e.g. some demos/examples).
>>
>> Should I send the beta1-patch to the ML or is it better to wait for the
>> final release?
> 
> Feel free to submit it. QML is an amazing technology and I'd love to do
> something with it on OE-powered devices.

If you like QML watch my few QML videos:
>http://www.youtube.com/matgnt

Nothing special, just the Qt examples - but built with OE :)

Regards,
Matthias


