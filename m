Received: from [209.85.217.177] (helo=mail-gx0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M0bJi-0002Xx-JF
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 May 2009 15:01:15 +0200
Received: by gxk25 with SMTP id 25so5920699gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 May 2009 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=7i5YFd0ZdF1gnBB5hhE8ij3AM4sVA0cqLfr8YO6paac=;
	b=lcQsvBATpvNyxmtOWLNq0pgs1KSpM1f2+4W5/CR3pz5QTXIY1GbLoSQUMwUYJVOKmJ
	xi8ygr3T50MtPCxL5F2EMp+gDvTMduH27MaoEuRIes61CdZBPg5KWYu+NaFf5wIPdwCr
	LDSP2zAgJ2HO69iwJb/NWZP/qjvt1N0adK/v4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=uCOU3BmcIJuItXbLV3m+JGOY9SKv2fahrMMJqs51LtZ16mfxGTVvFIJFkJLD3WyS+r
	R/AKsLzBlZu/a8zXli3SK2yIOL2PjKDSqzI8pIgF7pFfEbbIZRw29+zzTY/5ql0lVvjD
	FMOJ3K6iXEp/CDORpjDlJyoPRxObO20R8PXAI=
MIME-Version: 1.0
Received: by 10.90.96.1 with SMTP id t1mr1905842agb.45.1241355317826; Sun, 03 
	May 2009 05:55:17 -0700 (PDT)
Date: Sun, 3 May 2009 14:55:17 +0200
Message-ID: <c384c5ea0905030555t48379d37o700254a1c49a4600@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [RFC]: Remove #####...##### lines
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
X-List-Received-Date: Sun, 03 May 2009 13:01:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

#############################################################################
#I am a bit annoyed by the hash lines in some of the files
#############################################################################
# They distract me from the real content of the files.
#############################################################################
RFC_REMOVE_HASHLINES ?= 1

Regards,
-- 
Leon


