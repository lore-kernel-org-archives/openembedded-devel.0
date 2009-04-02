Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1LpKZq-00050v-9H
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 12:55:56 +0200
Received: by an-out-0708.google.com with SMTP id b2so599717ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2009 03:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bUi9kmyjgVxLfqIxSdgzZK//ehWZJZ5eVIWEOjstJHM=;
	b=KKBc0ddkJoBwPTLlclqoQj73YEmGYDR9KDnQCbOFSlrsnNpPdoZdi5D+pe1Ayoih12
	dlQvEIACY7qZAY625qSaYzXXI3AG6BdFyeizhSZG8fhS4amYQzjOvRNlLuq/mKxj+tbi
	VNJaIOM3ZaqZpVV8ZnVMFjVM/307g1I8CVL7A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rk6uUHRjNYKrT3+bgNVQqiF3I1GENIWBnKCOn1oYwyLyTpX8AI2Xt4ybizgf4YTzcM
	ibhhSYwE0fXhWoi73AH3nGMMvcwFm5b0vGaYIqV1F114W8+q/7hu+vtrNK46JDd3jvFU
	Ui0f3Q3XinoIKKtc0s3f0A30Ju4UlhiUNPR+8=
MIME-Version: 1.0
Received: by 10.100.109.13 with SMTP id h13mr8864332anc.140.1238669571947; 
	Thu, 02 Apr 2009 03:52:51 -0700 (PDT)
In-Reply-To: <200903311837.28324.marcin@juszkiewicz.com.pl>
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
Date: Thu, 2 Apr 2009 12:52:51 +0200
Message-ID: <d2b9ea600904020352v79eda72fk2fde69139ac29e10@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.245
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Thu, 02 Apr 2009 10:56:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2009 at 6:37 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
>
> I also imported BitBake 1.8.12 (last release) into "stable/2009" branch
> as this is minimal stable version which works with this repository.

Is this the new strategy for handling depedency on specific versions of Bit=
Bake?

/Esben

--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


