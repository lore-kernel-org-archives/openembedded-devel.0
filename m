Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P3bSp-0004mL-VR
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 23:23:52 +0200
Received: by wyf28 with SMTP id 28so19983wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 14:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=W2Q0zA1OwjUXa/6OsHAwI2/f/pqeoAHDTT+ijfStIkU=;
	b=bBgxKV4MAbgDAYwycmyRzNFnUQeoW79wi8qVqu18KdNHa/GSfl/u6j4TR3MN7CwLIC
	fh51z5UItBFwl/JwGQPRSPJnVjeLPaGQld4ASZM9chru8ffuWbEXIR3JWDR79DHePzuN
	SxRCAWavA6d54uQu1fEZnmJGq+dL4aG5Z+0Ck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=d9WT4OFXzTk/U3baI4ys+vEhkDUGdfnVr30ZEsjC9kelQVgcJUcshgZ7MRVdeqsXhC
	qfT4FQhrNeSuD3Wy12ojKbXcFPDVEINraPDEjbsjPyQU2AkHYb3/A2C2gYbjd/TesgdA
	vPZp4BAYpxn8aUpzZYzj5L6lzH7543vB8UkAI=
Received: by 10.216.62.210 with SMTP id y60mr8498043wec.91.1286400208263; Wed,
	06 Oct 2010 14:23:28 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Wed, 6 Oct 2010 14:23:08 -0700 (PDT)
In-Reply-To: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 6 Oct 2010 14:23:08 -0700
X-Google-Sender-Auth: JkR2HORZJaMfLipEFWMiJcQJYto
Message-ID: <AANLkTinshOg7ihNN7mD4Tr3HToPtkhLiyv4Oj63Tp5aA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 0/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Wed, 06 Oct 2010 21:23:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 6, 2010 at 2:08 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Below are 4 patches that change RDEPENDS into RDEPENDS_${PN}
> As I am not too familiar with these files your review comments are
> appreciated


For all 4:

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

