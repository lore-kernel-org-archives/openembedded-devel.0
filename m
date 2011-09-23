Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1R6tI4-0002dw-Hi
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 02:06:52 +0200
Received: by qyk4 with SMTP id 4so3877434qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 17:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gtEdZFzl6BSiT8vJQlTkXXgkfggTOzGFdgHRBFSP6SA=;
	b=xAx9Df0VtSqsfDTMhATOLCOmM3WQsGGWdgg5ZFiSLw+piFC7yMtFZW4hDwMBa+Ugk2
	T62DIsz5pDKuwqZ19ov1uJMMY7ldS1fnGpRVdvIv9EJp63eYcG8u/UCG2oBMqICgceSC
	WcIXSpMwLU2SJasqotGLpw5iOhK98+1STHZjM=
MIME-Version: 1.0
Received: by 10.229.68.86 with SMTP id u22mr2199158qci.226.1316736092012; Thu,
	22 Sep 2011 17:01:32 -0700 (PDT)
Received: by 10.229.43.228 with HTTP; Thu, 22 Sep 2011 17:01:31 -0700 (PDT)
In-Reply-To: <4E7A5ADB.1040102@balister.org>
References: <4E7A5ADB.1040102@balister.org>
Date: Thu, 22 Sep 2011 17:01:31 -0700
Message-ID: <CA+M6bXn8eN71CzFeV_SPe1yu-mb3j0ZD2UnRdWEmEzhEcA_VkA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request #2
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
X-List-Received-Date: Fri, 23 Sep 2011 00:06:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 21, 2011 at 2:44 PM, Philip Balister <philip@balister.org> wrote:
> https://github.com/openembedded/openembedded/pull/2
>
> These are updates needed for the USRP-E100 and include some fixes for
> building the maintenance branch on Fedora 16. All commits are cherry picks
> from OE Classic.

Applied, thanks.  And for the future, I think it's possible to use the
normal pull request script and point it at github or whatever :)

-- 
Tom


