Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LuQpK-0003Cf-6E
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 14:36:29 +0200
Received: by yx-out-1718.google.com with SMTP id 3so278647yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2009 05:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=cyRVVfihDq8yf9p1r1tGAw9r4GStpegN5FIBJ6Kcubw=;
	b=FWiAWUHIrKqg5IZ/EQvD3ygQiagkREywcHDC/LXQOrKRQt9WNMCLtm2HZKlRCU2Zng
	eoz+utgYODHTORYedk3ssJchTdDRi94QiqEAoPrLfwx60tzOS5RCDZ6V1NCSKc4ZQwTC
	+8rqMr0NtMJIfTMB64ptyLL8+Jwg6Mh4DokDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=DActmR7G2wb3EKaU3ozQYrKeznPl6Ql//qcVzYPihsCXH4b8ob6ZPhzhXz+ddvTUjW
	uRe34r0vBrN0+FVRJI8e7HQ9xvswvifoV4673xguKWt5N0kgZISbUsatxPdigBXoIUTu
	bflEeOIasHepve93cSqiAIkkoBuk0J8yocFo0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.213.18 with SMTP id l18mr1740099ang.59.1239885141788; Thu, 
	16 Apr 2009 05:32:21 -0700 (PDT)
In-Reply-To: <b6ebd0a50904151723pe7087adkb69e57d608e8b226@mail.gmail.com>
References: <1239782395-12413-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
	<b6ebd0a50904151723pe7087adkb69e57d608e8b226@mail.gmail.com>
Date: Thu, 16 Apr 2009 09:32:21 -0300
X-Google-Sender-Auth: a5409340cb78175e
Message-ID: <be7a9f3d0904160532o4533f31dh81e5314814b8b1c4@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.156
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: Re: [PATCH] base.bbclass: Combine all checksum.ini files found in BBPATH
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
X-List-Received-Date: Thu, 16 Apr 2009 12:36:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Apr 15, 2009 at 9:23 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Apr 15, 2009 at 12:59 AM,
> <petri.lehtinen+openembedded-devel@inoi.fi> wrote:
>> From: Petri Lehtinen <petri.lehtinen@inoi.fi>
>>
>> This makes it possible for overlays to have checksum.ini.
>>
>> Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>
>
> Nice feature, good to see.

A very good canditate for stable, IMO.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


