Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NCtIO-0007cB-PR
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 12:11:00 +0100
Received: by pwj11 with SMTP id 11so4103891pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 03:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=Rut5Zj67noOUAWrek0GB1hkPUQkXYLi1jEI2Sfr8QAY=;
	b=PKW98r6NAntGnjOO3ON+MbwbISJSySCFTubrkfXGWvq6WsPxNoRNVlelMxxSvBLraQ
	AYVb570qg+gmoHweiXLOILDJm+LIUsVt0MtilzhJ6HeksosOuKoLCwEzmijfYZqO/ap1
	BoUAET0R/Uck6SUzGcyt4kNgCTeZhijsL5l+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=YUY2MFgHvuhsr3vElS5t+zbeWLFJKpdwgf2kRrF2KTh1E7Kv17ywUKW83ja1xC2Rn1
	pEJrwdhZ6zix4pqXYMhffStt/VIdevXlnq1YcAGb7/bJFhNiFFp7Kl3d+zu4fruvYiql
	6XZg+kZLzmssDHMdVzp3z9VdXLJRQr5PZvhss=
MIME-Version: 1.0
Received: by 10.142.60.18 with SMTP id i18mr641402wfa.111.1259060967297; Tue, 
	24 Nov 2009 03:09:27 -0800 (PST)
In-Reply-To: <20091124102028.GG28485@jama>
References: <E1NCsJm-0008Ly-9m@melo.openembedded.org>
	<20091124102028.GG28485@jama>
Date: Tue, 24 Nov 2009 21:39:27 +1030
Message-ID: <6ec4247d0911240309o4f296a6cy42dcbdad758afcc4@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [oe-commits] Koen Kooi : opkg-target,sdk: bump SRCREV
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
X-List-Received-Date: Tue, 24 Nov 2009 11:11:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is there a reason why another update-alternatives exists at all?
Wouldn't it be better to get fixes merged upstream?

I would be quite happy to accept diffs.


