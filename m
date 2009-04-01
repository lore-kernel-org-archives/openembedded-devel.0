Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Lp0YO-0002LI-Mg
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 15:32:28 +0200
Received: by bwz19 with SMTP id 19so43146bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2009 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DFQbhFDL9vV4t+y1KL5u4KduGSxhZqLwM7irPc//Xyc=;
	b=sGrNkg9h5tUAaMYBhNF6rCtswwHXVabkJiZnNraLtbFHUs/r/FA1bYRf08yn6m3VMN
	d/Qn9a03Rj3/t0j8Z6kBgQ2v/zoVDNuSpgZTNojTPAAVRlh5B3nV+5hiZw3lQx+M+ebV
	xnK4V0clgi1hlvYlxDiGoEUPJc3LanQzvHz9U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Cegl0sqeypQTBRYMSyQwGVABjsrspEDZK8YjLcoGslEfv5Uqk7SRfBXgDOVxigXyk2
	bNQQOa6tO3BjKFLPapButB3df4mzKeZ8MO2FLMmkLl3/t5T9pS/mngOWjP2PtZRT2RX+
	BllZftbYDgxM603+PYuMSz03AvxkrkAaohwG4=
MIME-Version: 1.0
Received: by 10.223.126.66 with SMTP id b2mr6177137fas.67.1238592607674; Wed, 
	01 Apr 2009 06:30:07 -0700 (PDT)
In-Reply-To: <gqv6ce$k19$1@ger.gmane.org>
References: <gqqq0q$or5$1@ger.gmane.org>
	<05187d8f9a873df8504511279c44af7c02b4facf.1238542568.git.andrea.adami@gmail.com>
	<gqv6ce$k19$1@ger.gmane.org>
Date: Wed, 1 Apr 2009 15:30:07 +0200
Message-ID: <d1b08f940904010630j5df99956m7196d77632335736@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] angstrom-2008.1.conf: add PREFERRED_VERSION_psplash
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
X-List-Received-Date: Wed, 01 Apr 2009 13:32:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> What does pulseaudio have to do with psplash? Looks OK otherwise

While I was there I cleaned some tabs...but I'm lazy and did not check
whole file...

Cheers

Andrea


