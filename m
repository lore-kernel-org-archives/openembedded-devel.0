Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1LpoMj-0001ix-TR
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 20:43:48 +0200
Received: by rv-out-0708.google.com with SMTP id k29so1167514rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=E9BteTe1cVVLeK8ApnfLVIHKUljPORS7FHro3eDZ6a8=;
	b=Tx+Xx79+oPL9O2cZuInQ4uvizpSUMPgh43sZLCfn6ddIs1iosVFqumxozxfZgtc8sE
	voJNH24TtDSxvC4cwRkgupFyvjis1+nVqf9kHgCkxNxBjDNAsn8lbir7skCk/qXA56+V
	4xnrWHIy1YlhVs1JgeKp9mbuSPaEnO+6vqdcE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Dn7jioZ0VWt3yTgSjCvSrgpn7O+dEggpcpexsmNBFgSmWnCkD9TcEzoFDYN1icrQBO
	QSUSD71CzBx0irL116tBusjO8CovWKUHSACRz0jmP3TNOg+y79LEJzfu+6KBBEiHHnWf
	mdSZEm/9dryN/mPF3ojlMT+bKTLFNiNK4Aas4=
MIME-Version: 1.0
Received: by 10.141.26.19 with SMTP id d19mr672331rvj.137.1238784072652; Fri, 
	03 Apr 2009 11:41:12 -0700 (PDT)
In-Reply-To: <alpine.DEB.1.00.0903270937550.19091@localhost.localdomain>
References: <alpine.DEB.1.00.0903270937550.19091@localhost.localdomain>
Date: Fri, 3 Apr 2009 11:41:12 -0700
Message-ID: <f46da1cf0904031141tb548303v4eb83ab881e825bb@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.198.249
X-SA-Exim-Mail-From: taroth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add machine support for TS7800 boards.
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
X-List-Received-Date: Fri, 03 Apr 2009 18:43:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ping?

On Fri, Mar 27, 2009 at 9:41 AM, Theodore A. Roth <taroth@gmail.com> wrote:
>
>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> ---
> =A0conf/machine/ts7800.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
18 +
> =A0recipes/linux/linux-2.6.28/ts7800/defconfig | 1926 +++++++++++++++++++=
++++++++
> =A0recipes/linux/linux_2.6.28.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A03 files changed, 1945 insertions(+), 0 deletions(-)
> =A0create mode 100644 conf/machine/ts7800.conf
> =A0create mode 100644 recipes/linux/linux-2.6.28/ts7800/defconfig
>


