Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LmnRO-0004Ct-Cj
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 12:08:06 +0100
Received: by bwz19 with SMTP id 19so459330bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2009 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xaP0o6PzjTwzljnv5y8Ap6sSpE9S0Xzmn1jgf3ifFak=;
	b=MpkCXh4u27COMElNGvIJeRKC90EgoHzjygZLWvO3Cq/0D0Afq9Qk32dRN6B9u84YJ5
	oYlawJrEPEuFrwbwnEp7Fr+UL+vQJk9s45FozPCpqfgYvBrs/oOwUNuFOXDlU4w5SQz5
	CkZs+E0/axDD6z6NMM5VTxaRFSlXXIqN2NfQ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pLSScIsCKS5kO4G2e0CKGzzDA1mJ84q0mlQZ6udAcgq+CTrs+z0plsVteHi62mM8xe
	WNbK6txO64YKIWmRp2JzRSD4xlOYsxSxoPaBJ51J1Ir1DAwc7MzIZ1kB2c1cSFZDRT0k
	VJGgkDa/eolItn9s0WI4r3TDSRby574RqndDs=
MIME-Version: 1.0
Received: by 10.223.127.8 with SMTP id e8mr511127fas.95.1238065582720; Thu, 26 
	Mar 2009 04:06:22 -0700 (PDT)
In-Reply-To: <gqfmfb$3al$1@ger.gmane.org>
References: <1237737623-10538-1-git-send-email-matthieu.poullet@gmail.com>
	<d1b08f940903220927v2f820afia681d67bdbd50b54@mail.gmail.com>
	<20090322172416.GA16899@denix.org>
	<d1b08f940903221104u5f0f1328i8918a50ec49541f7@mail.gmail.com>
	<d1b08f940903221630p3e0bc9a5i443e8ada0a40fa03@mail.gmail.com>
	<20090323000542.GL14278@smtp.west.cox.net>
	<d1b08f940903260147n5fa49a1bxda7506b14bab20b7@mail.gmail.com>
	<gqfi0r$l4o$1@ger.gmane.org>
	<d1b08f940903260323y4660a2abj53c9738e3562d3aa@mail.gmail.com>
	<gqfmfb$3al$1@ger.gmane.org>
Date: Thu, 26 Mar 2009 12:06:22 +0100
Message-ID: <d1b08f940903260406m7a6c05bcvfbda2ab07bc567be@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Angstrom: weak-assign DEPLOY_DIR
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
X-List-Received-Date: Thu, 26 Mar 2009 11:08:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The fact is even the standard case (deploy_dir inside tmpdir) is broken...see
http://bugs.openembedded.net/show_bug.cgi?id=4234#c2

Sorry if I'm mixing apples with pears ;-)

Andrea


