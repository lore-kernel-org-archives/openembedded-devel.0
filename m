Received: from [74.125.92.146] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MGFGf-0003mI-Oa
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 18:42:45 +0200
Received: by qw-out-1920.google.com with SMTP id 14so1973279qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2009 09:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=i3VTHcvPgaEcGX0Z40N328X89ff0SgNxOD+hFKYc7AU=;
	b=GQ+oJ+PFUXh/6LTifaoAs6MgCfVbovyHnjb+B8Szku8C0UBYp36f8efxrBDbEUKqJv
	Pq8OD3aIZOqWWyiYUYlqJlf+zHf+sfVrFjTVFXoZCmj4Shko8TiWfM2eRFNZC5Hd3nq3
	0tMZP8FUvVQ6LV6OehydIHclF8O2fDixtyEAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xiVCJ0+FB1uNG00I6Z/O7y/kaEJwc9MQm+wAzxaSBMG1EZo7d0izHN2i+xa/6GtHpR
	moxuixmK2rA36JcFNooVsikrPEG8tGN7sWJaJQgOsnBBDsdCIoICtsPRRS2Km96IaBFq
	T+5hv2sbpBvfeWloiK+/ZKIRe2T8UiRn1Ka5A=
MIME-Version: 1.0
Received: by 10.231.15.195 with SMTP id l3mr2603741iba.16.1245083551465; Mon, 
	15 Jun 2009 09:32:31 -0700 (PDT)
In-Reply-To: <522EC177-58EA-4408-857C-5A010D5C2A1A@mac.com>
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
	<h1557n$fir$1@ger.gmane.org>
	<A333C385-1DED-40D9-AD9E-08DF830A732E@mac.com>
	<4A3665DF.7040109@balister.org>
	<522EC177-58EA-4408-857C-5A010D5C2A1A@mac.com>
Date: Mon, 15 Jun 2009 18:32:31 +0200
Message-ID: <c384c5ea0906150932p1d9cf9e9u2f02da4ffe21d27c@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Help required to create recipe for FANN library
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
X-List-Received-Date: Mon, 15 Jun 2009 16:42:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Mon, Jun 15, 2009 at 6:11 PM, Elvis Dowson<elvis.dowson@mac.com> wrote:
>
> If you look at the log files, nothing gets configured or compiled. And the
> image folder is empty.
>
Try setting the S variable in the recipe.

See other recipes for an example.

Regards,
-- 
Leon


