Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Mmvhc-00069F-GY
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Sep 2009 22:29:43 +0200
Received: by ewy19 with SMTP id 19so2503736ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Sep 2009 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=W1JaxXUnxwJeem+86EImyaGab/6vd5h0+HkcWmM6yCI=;
	b=n4ybijNSzoN6hqGd5ZK6Cn6+nKzrg+7xCBUmLQdRLRI2uJAhxzskArxJVFMxobQdk2
	SVokSTXXFRr0t/9IsMK3m8pITzUatqL0L+FUc70jz0788hpHKXvko+c2WdC1zQYdmDmO
	AqDaT9PGhJqxGvwm19I1bD0nFPtH7ysP8XX0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=emi2jY4sHqnASsl1bBhN/Nogcv0fUd03UYjI2LsmeO0wUMVGrWmopUDU3KwBox16dD
	EnKi/PNmDNBrjPU9oVYZUZwvNsiXUGcdgVwBK0DVuRRkFxIt33jqMWWIycPxD9GUQsvV
	ZEp/yy+dau0C1q2vMrDk7t4+jt2V9XSqJW5KA=
MIME-Version: 1.0
Received: by 10.216.54.143 with SMTP id i15mr1110154wec.222.1252873750093; 
	Sun, 13 Sep 2009 13:29:10 -0700 (PDT)
In-Reply-To: <20090913000405.GA29370@gmail.com>
References: <20090912200308.GA10819@gmail.com>
	<20090913000405.GA29370@gmail.com>
Date: Sun, 13 Sep 2009 22:29:09 +0200
Message-ID: <d1b08f940909131329i3905cd32me65854fff3efb4e8@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.219
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] mysterious armv5te-linux dir under staging
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
X-List-Received-Date: Sun, 13 Sep 2009 20:29:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

After rebuild from scratch the bogus dir has disappeared!
Tested on angstrom/dev/glibc/c7x0

Acked-by: Andrea Adami <andrea.adami@gmail.com>

Thx

Andrea


