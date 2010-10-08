Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P4Jia-0007LS-5T
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 22:39:07 +0200
Received: by qyk30 with SMTP id 30so427264qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 13:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=RC8yLTfjbJDUnZLGpKYLQV27zotq/QLnzhUNq0T0sa4=;
	b=IEhf5t0cqEg1bV3eiSb9RJ8H+IxKJ+UtmDCm1TIxuD22C4Aip4M+N1SFfrsAUx8VuF
	16Vyys/lFBF630FmjLUN9F/r0sG43qeBcsS3dtvD+FIuk6Yi5F+acUY28KE0l3pNbQe+
	+zVbF4XVtkRNw2ax0sZMnyvPvgKtZCy6L6Feo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=j4Z/uq119fn4XigJ9RbBx+hZyERhOb+6sehz7FaQFg9khxgjOmFX3fVNRYgoM2lv8I
	aH6pU9WfqQULHnjpc4gOKx1BHbW83npvUF+wUtXgWBFuHjrKUxqE0qkBQFTF7kh94C3c
	BFtLUWBXug4pnFJ5nODHM14UXx/gb0mr41658=
MIME-Version: 1.0
Received: by 10.229.96.17 with SMTP id f17mr2445020qcn.142.1286570296871; Fri,
	08 Oct 2010 13:38:16 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Fri, 8 Oct 2010 13:38:16 -0700 (PDT)
Date: Fri, 8 Oct 2010 13:38:16 -0700
Message-ID: <AANLkTikE9syXK_vozUd4EaRVf3oZmfKxrbmedb-uqDx_@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Add extra include headers for kernel
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
X-List-Received-Date: Fri, 08 Oct 2010 20:39:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

What is the proper way for me to be able to get more headers to be
built into the kernel that the current ones that are compling in?

When I look in tmp/sysroots/overo-angstrom-linux-gnueabi/kernel/include
there are some .h that I would like to have in there that are not
currently in.

Thanks for any tips on this


