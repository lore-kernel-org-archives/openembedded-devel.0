Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1LsynC-0001DC-Qt
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Apr 2009 14:28:14 +0200
Received: by rv-out-0708.google.com with SMTP id k29so1439211rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Apr 2009 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=JwtJwn/m0AzHXZDdFeGeTpzlSV0cOeMYxCZ15aJMm04=;
	b=ixrd6aXAT+X5VVaB5dNjbV+fj+N+qy94QIHyPZyosgKn4sLMrGNY3VrW/QHs9/eNKI
	PFOxhz/oeYuJvRGXJ6G4YiesaT0hGGhoZKFZVblKGWBE9D8dOAsZCTeMozGpbhu3RTWq
	0jqGSCWjOjpsg+hKOgT5eYTrFgvPcoGTLzC6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=De5Vm63ktBgf2Sia/xAdkrY4kMWnbNBYb+cKSbEki3V9QqWesajqQK6ebkDKrGYo67
	Ujvx2Ipx3k+DutHSoNCOV71iciIwfVZ3eauBpN7c4Vu4eV3TQShSCtZKWqVxqrt9UYWh
	yDJSEJ+JljtXsrSPlFCviYjwoaOaezbjJgEoY=
MIME-Version: 1.0
Received: by 10.140.132.4 with SMTP id f4mr2311554rvd.211.1239539082537; Sun, 
	12 Apr 2009 05:24:42 -0700 (PDT)
Date: Sun, 12 Apr 2009 20:24:42 +0800
Message-ID: <565965130904120524l46b9e4e7x4e8762ad9cbb1f6d@mail.gmail.com>
From: Tick <ticktock35@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.198.247
X-SA-Exim-Mail-From: ticktock35@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bb file of madbutterfly
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
X-List-Received-Date: Sun, 12 Apr 2009 12:28:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Koen,
  I had created a bb file for madbutterfly,
http://www.assembla.com/wiki/show/MadButterfly.
It's a library controlling SVG objects. You can use this library to
create applications that breaks the widget boundary.
  Would you like to take a review of this patch. If you think it's
okay I want to commit this into recipes.

Thanks
Tick


