Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NSahN-0007hX-J3
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 19:33:40 +0100
Received: by fxm4 with SMTP id 4so14598160fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 10:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=KYgBRsO1fcrHxQljb/aWg1eH8TCEVcMxqtyPld40N0I=;
	b=JqqKDvTomH71syicT1moxTAdd/vdV9dfzMgP1GIfs/RZfn6THQCgCARICUvOvlzC4I
	BT8rlKUKVjlk0SmSLHLpvGuGPuvgAHzgTtM4mjpKylABAeKiiknVc0CtMmi9uHLe/v2h
	HCcsLrZ/M+m2nVUvMWRcuKp2nS6v2kk6GDc1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=VE/NWFIk1MxPsodNI+yOxtoRRddVAWWlnEEssUpwoQSQ7ojmytc7qaUtBLoA14CnRS
	167wb8hvaCwxUHUlRmmXK2mMZV2gb1MCd7lM/z+Ccip21k6GFmMYK7B4o0kXdX6y3S+q
	ZkRI6g2kYQloNwm3Td/6Bs4hr8b91pCGjLTCE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.134.18 with SMTP id 18mr1292966hbx.42.1262802693083; Wed, 
	06 Jan 2010 10:31:33 -0800 (PST)
In-Reply-To: <4B424818.3030603@cbnco.com>
References: <1262450620.5161.33.camel@gnutoo-desktop>
	<4B424818.3030603@cbnco.com>
Date: Wed, 6 Jan 2010 16:31:33 -0200
X-Google-Sender-Auth: ddf093ffd306b288
Message-ID: <be7a9f3d1001061031i6660f42emf51273ac5e5e6fe1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: DOLT(doltlibtool)
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
X-List-Received-Date: Wed, 06 Jan 2010 18:33:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Mike,

On Mon, Jan 4, 2010 at 5:57 PM, Michael Smith <msmith@cbnco.com> wrote:
> GNUtoo wrote:
>
>> So far I identified 4 software using dolt:
>> *abiword 2.8.1
>> *goffice 0.7.4
>> *xf86-video-intel 2.9.1
>> *gmime 2.4.10
>
> Also xserver-xorg (patched in c10e9906a2ecea7e9c04bf967a8882d6b4cd1077),
> cairo (b57a5b04cd35c935bd7ed46ec8db07ec7c0766db), and webkit
> (c70445331f91cb7f02503e7567927b9b6e40e6bb).
>
> The real fix is to get upstream dolt.m4 updated with this patch:
>
> http://lists.x.org/archives/xorg/2009-May/045835.html

Yes, this is the right fix however Xorg people didn't push it YET!

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


