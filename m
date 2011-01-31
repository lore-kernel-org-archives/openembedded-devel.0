Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1Pjq8r-0003l3-KS
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 10:33:49 +0100
Received: by qwi2 with SMTP id 2so5082005qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 01:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=T/7xHMe6Ql/kz1kuv3SvaGEARCfrdBzm2dp/jnt3KE8=;
	b=w4zjfmuuubrHopvoWAowYGgdoFpXo16PhNbIQTQDK8q16r6h6I5fdOwuwBmPMZL9UD
	ruH9RsN9LSR1+J91EyO0kbhi3x7/qIW+Xua9Dou4EBTDQRDBwCwxfm02pqfqql3hpFZi
	OzHQu3PJAMishYiFnkey8+bPdRt7Aftk0tQw4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=R2GBUeMg/KDfPu7veJFJ/RGM9z8meep2NGjS78Sn993H2errj7WZ048cTEMDotCS3G
	bSstfqhTPFUr8zxUHximj3Px3FuiASsLKj8Euj2W1qmUVgLwqzR1RG77VEUHjfFOm9ya
	n7w/PUmU9k95N7yY2+jYuTMyrxvs3FTXa7xm0=
MIME-Version: 1.0
Received: by 10.224.74.77 with SMTP id t13mr6144906qaj.217.1296466375629; Mon,
	31 Jan 2011 01:32:55 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Mon, 31 Jan 2011 01:32:55 -0800 (PST)
In-Reply-To: <ii0nkm$dpn$1@dough.gmane.org>
References: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>
	<AANLkTim0qsgQExvKhTQtPAyZz8cPos4osWFDDmxfEhjx@mail.gmail.com>
	<ii0nkm$dpn$1@dough.gmane.org>
Date: Mon, 31 Jan 2011 10:32:55 +0100
Message-ID: <AANLkTinXNCdtGBOHyaHmAvEor+zSs+c+UrE4QJxHWe+x@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Mon, 31 Jan 2011 09:33:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks to all

I tried to correct problematic line (PREFERRED_VERSION_linux = ...).
If i understand it wrong please let me know.
I have created and commit-ed new patch.

Best regards
Marek

