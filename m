Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thomas@gstaedtner.net>) id 1LMmZz-0001cN-Bv
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jan 2009 17:57:27 +0100
Received: by fg-out-1718.google.com with SMTP id l26so69912fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2009 08:50:56 -0800 (PST)
Received: by 10.86.84.18 with SMTP id h18mr28471fgb.22.1231865456335;
	Tue, 13 Jan 2009 08:50:56 -0800 (PST)
Received: by 10.86.26.6 with HTTP; Tue, 13 Jan 2009 08:50:56 -0800 (PST)
Message-ID: <c16a574a0901130850l6b18cban26b21dbb20bb4004@mail.gmail.com>
Date: Tue, 13 Jan 2009 17:50:56 +0100
From: thomasg <thomas@gstaedtner.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gkig6q$alf$2@ger.gmane.org>
MIME-Version: 1.0
References: <c16a574a0901130824w742cc8bera0f17d66d12c0e1@mail.gmail.com>
	<gkig6q$alf$2@ger.gmane.org>
Subject: Re: Request for inclusion of euphony_0.1.1.bb to the tree
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
X-List-Received-Date: Tue, 13 Jan 2009 16:57:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 13, 2009 at 5:40 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> You don't need to inherit pkgconfig if you don't stage anything. And even if
> you did, setting AUTOTOOLS_STAGE_PKGCONFIG = "1"
>  would be preferable over pkgconfig.bbclass
>

Ok, I removed that, link stays the same:
http://projects.gstaedtner.net/euphony/euphony_0.1.1.bb


