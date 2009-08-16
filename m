Received: from [209.85.220.218] (helo=mail-fx0-f218.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ilya.muromec@gmail.com>) id 1McbUs-0001aH-Es
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 10:53:50 +0200
Received: by fxm18 with SMTP id 18so1853278fxm.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qYLwrxAUP+DQmzS500ByfFV04Tfe0GOehFuWj8xVRUI=;
	b=MR3++ca1uIZ/SpkXaT7+9ZUBDUuVycKhn6b3d3B7TGbqdQteveqawdVHG13VO7g2qN
	vM4835pw3rH7XEt9P71irGxM8n8ZJPkltp42b2gfUDBlU/FSNcYxnnrNyOdyTxuKclQf
	BuhkcQPdL3GjwmwF1M0UK0iIZUUClMVofPDd0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=se3XNrF9z+MzlZnYLrr8NzATEpRaZajpEtfCEHut/tPx9dmPmMG01FEShNjKBVBdzx
	BA29+rqoOIDSgiX3FIdDV3A/NEy0Xh5tFbB0Zd8ebvrrZWIMEZ2uBvyJKVhH30noCvih
	XH0M15OdO1Hq5jLy7pdoxfYfB6h59PqB6AIUo=
MIME-Version: 1.0
Received: by 10.204.67.146 with SMTP id r18mr2017518bki.88.1250411819122; Sun, 
	16 Aug 2009 01:36:59 -0700 (PDT)
In-Reply-To: <200908161025.38803.holger+oe@freyther.de>
References: <800a98740908151812r65a3c267h104241a2e32a1222@mail.gmail.com>
	<200908161025.38803.holger+oe@freyther.de>
Date: Sun, 16 Aug 2009 11:36:59 +0300
Message-ID: <800a98740908160136r20a4c7ceqa5e55817d782ff53@mail.gmail.com>
From: Ilya Petrov <ilya.muromec@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [patch] add 18 bpp support to psplash
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
X-List-Received-Date: Sun, 16 Aug 2009 08:53:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

2009/8/16 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Sunday 16 August 2009 03:12:35 Ilya Petrov wrote:
>> Hi!
>>
>> Here is small patch to add 18bpp support to psplash.
>> This needed for motorola ezx gen2 machines (like moto a1200).
>
> did you send the patch upstream? Do you have a bug report or commit to point
> to?

no. it not looks alive..


-- 
 wbr, Ilya
 ICQ: none, Jabber: ilya.muromec@jabber.ru


