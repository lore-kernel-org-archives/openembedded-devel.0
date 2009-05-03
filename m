Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M0ar9-0001SZ-9P
	for openembedded-devel@openembedded.org; Sun, 03 May 2009 14:31:43 +0200
Received: by yx-out-1718.google.com with SMTP id 4so1883955yxp.30
	for <openembedded-devel@openembedded.org>;
	Sun, 03 May 2009 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=fWyqkICp/dEyxYlxbGoXJ0GGKVGPQGiV63PofNy1o+E=;
	b=ZogDOMfhnzjlX6TRzRlPt1Gb76/x0F2lsVOWvxMfNI/HaGYo18d/7IoqwCnPzHDFPC
	onzQfrFrE3jPgpU618Uz2FJOB9Dkq0oD+VRsLWcjr8Y/0SL7YhZVd9UbWPXNWb/td3p/
	fOwKlhF9jJOEeTIfalP2lrOj+LLVtQ4hcdX+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=kWobgPFEibqwrJBd05w2LTL5fFh1qE9VXi3DVVbItzEzBC4yHbxZBUEWLr9WjlU7XY
	GXRo9AOG4NMSc+y75XaG95hyo2KfWP6sRK03c2e1vqB4zoQvNRQ59Pmada3iOSPgjBsO
	sM4fRaGGgcCDTA4b5dmPfYhwNTEt0pMbl9/Pg=
MIME-Version: 1.0
Received: by 10.90.91.9 with SMTP id o9mr3856087agb.81.1241353562633; Sun, 03 
	May 2009 05:26:02 -0700 (PDT)
In-Reply-To: <49FC8D88.3050608@gmail.com>
References: <49FAE94F.2090101@doredevelopment.dk> <49FC8D88.3050608@gmail.com>
Date: Sun, 3 May 2009 14:26:02 +0200
Message-ID: <c384c5ea0905030526v68304d0em5fd630ec8aef821@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: =?UTF-8?B?UmU6IFB1bGwgcmVxdWVzdCBmcm9tIERvcsOpRGV2ZWxvcG1lbnQgLSBOZXc6IE1pY3JvIGRpc3Ryby9pbWFnZQ==?=
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
X-List-Received-Date: Sun, 03 May 2009 12:31:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Sat, May 2, 2009 at 8:14 PM, Marco Cavallini <koansoftware@gmail.com> wrote:
> Martin Lund ha scritto:
> +1 from me and I'll be glad to contribute with you to this effort.
>
Enough ACKs.

Although it touches (core) distro's, it does not affect anything we
already have, so I pulled(/merged) and just pushed this into OE.

Thanks,
-- 
Leon


