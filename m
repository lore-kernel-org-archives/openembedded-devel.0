Received: from [209.85.217.219] (helo=mail-gx0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MASvH-000125-5W
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 20:04:47 +0200
Received: by gxk19 with SMTP id 19so542761gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 10:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7Zvt5YFX9UNgyuxjJULJvtvXtHenkx2+U1RNgwTNEjo=;
	b=Zd7krr2cKE+PIkr41vWmJbiVmPwio9dWSbhCCS+NRKUFttJEPwE0psUaE8tXssea4i
	OK04n64NsgKFeifZmpiZ4PzPhyqRCfFlFLoGrf1pzQPeJtMNoqj8xE8IFmpU4DsXYXYF
	Nfmp9aMC2xkZKEQlc77/dPshJnNggkpWmXlfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=urs5hiLUw3h+z+Y0E/lLy4iNa3/sIvE/Wy8U2gx/TOcZeAqNXM6pN6PQCkgYTs58cK
	1aeBHmF53sKi8bFI4I9ncyo/+CHtte8bS3HRNQMqzO/s8sslH4kZ6G5Z+yX5ihBL2pSQ
	9F26ayviZ9dDThvg8QhMYyDIe0m9U+CmNBd9k=
MIME-Version: 1.0
Received: by 10.151.39.1 with SMTP id r1mr7668044ybj.339.1243706172242; Sat, 
	30 May 2009 10:56:12 -0700 (PDT)
In-Reply-To: <gv95qo$q7c$1@ger.gmane.org>
References: <gv95qo$q7c$1@ger.gmane.org>
Date: Sat, 30 May 2009 13:56:12 -0400
Message-ID: <f96d234e0905301056idd88bf5pa7facdfab5fa3325@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: update hook br0ken?
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
X-List-Received-Date: Sat, 30 May 2009 18:04:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Sat, May 23, 2009 at 11:47 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Hi,
>
> It seems during move to OSUOSL the update hook somehow got broken.
> At least I don't see any commit-regarding mails since long ago. Could one
> blessed with administratie powers check for the state of the hook/mailer?

It is fixed now.

Thanks,
Cliff


