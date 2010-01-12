Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NUi1U-00012Y-4p
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 15:47:11 +0100
Received: by pwj3 with SMTP id 3so528458pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 06:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=AiVqv4aBbvIPheTIOpRMkOcJG5qOsCmzjWqLIoSpFDM=;
	b=eDBpWE7u/gQCpVV6uzaJtmx9EtI8pWGvOVrna6gPzf4r3fTbduON/c/g84VVAoheCQ
	gYplB/N2Bbr9iZIAFQglCCRAlGn9OJaes8awFCRvlRQgwZqRAhcAVYYlUqpjf2EqWrUF
	ULfmWg+UQCLtM+aPq3PduJatWUn1on6gp6fdc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bcqHvPlBt0FKewpMy5o/UIqjkWYqof8cL83x2WwEjw3KhUHcHryLmrZ9jHnt0jgLbY
	bgIuQMNtnNGzo562sM2LOfd0j0m+PzViYRIuLagFRCdLLxeksE4awi29S+8gnNTrzTrl
	G3AD+NRgUvD5yvcS6aeVnYbk6Og+RvXnsSA9Y=
MIME-Version: 1.0
Received: by 10.141.214.24 with SMTP id r24mr10272986rvq.27.1263307497915; 
	Tue, 12 Jan 2010 06:44:57 -0800 (PST)
In-Reply-To: <BAY127-W199A6B7DA19A55E32E8648D86C0@phx.gbl>
References: <BAY127-W199A6B7DA19A55E32E8648D86C0@phx.gbl>
Date: Tue, 12 Jan 2010 15:44:57 +0100
Message-ID: <d1b08f941001120644q1a82954bhc3e867abadc9fa66@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbaking helloworld
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
X-List-Received-Date: Tue, 12 Jan 2010 14:47:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Saleh, the ipk can be opened with ar -x
Usually one *installs* the ipk...otherwise you can have hard time with
the dependencies.
(not for helloworld, happily :)

Regards

Andrea


