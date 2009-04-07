Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1LrATK-0003lw-4z
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 14:32:12 +0200
Received: by an-out-0708.google.com with SMTP id b2so4313154ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2009 05:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SFoT4LD0Sg3GWYZHk6zmLNuLTX5O8aK9bMuc8z8eatU=;
	b=KAVy67PDOHR/tyQfe72TqpQkJOGBZB1FrI24pf3vAdMKt2PiCbmbWNb3MUhzvwY+Ap
	Z/OTHwpjqQcAbvBi0VN50UEhNoBrHNJ+H9zVNTA5KRsCfhhHkym7vyVwbBhvCPp1CSgV
	DBJUarpQrI5cKwcRWp+JMk3a52dkeqH6qvjug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NkEhkIhUkYbf0gIcbZm9M2JzD+g0wOP2hOZ+E+/eg2iDNtutNI1dlA7i9uVWEkoyHo
	29BJ9rMziVatGxZvFlp8Q+PbUuEd9VgWB08ls/jozdEwGT6Tr7Nx4Qg0E8pvlPTTOpqI
	g6S0z/ii68dYbnSJQrTr1ydVqOcspE79E7f2U=
MIME-Version: 1.0
Received: by 10.100.108.2 with SMTP id g2mr87519anc.137.1239107347886; Tue, 07 
	Apr 2009 05:29:07 -0700 (PDT)
In-Reply-To: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
References: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
Date: Tue, 7 Apr 2009 14:29:07 +0200
Message-ID: <d2b9ea600904070529q6bd7292cy3482074a836803e4@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.245
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Tue, 07 Apr 2009 12:32:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I have now tested it with org.openembedded.dev branch, and this patch
should be applied there also.

/Esben


