Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5xv5-0003jm-Jx
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 12:23:35 +0100
Received: by iaag37 with SMTP id g37so1951191iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 03:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+QLvrJAaOh944FDBlJhGgkKWqrE2jCm0HKE00MsDlsg=;
	b=W7O9Tk5xLwkuRU9XSWDBoj3DszEFI8f45eteEGxQk/mOkhEKCrWRcSTRGE3xmS+ekr
	yEaOk2d/Q23OFi1tmYJ9l3XdLxs+NysGjAcMZaNp5U7bYdKt+k3wtGvWnB36Er8U5Hod
	IO9xL6jaxWI1rwDZhy7H6d6P4M+eShI1KJd3l5bHBR5t7qAFPkrCkL8dmuajYEBzhFhR
	us9rmjKNeuSOR9xU9TVBSAcrfsAYV1XvlNqiRNn2K+0SsBb15Fuks9Q6bNoTMmPl2EgF
	zfZz1gUiefGlh+dsMvikwGeqjs1UNxPXtUFChBODcdMUgDoTbKfgdvxvXHCGxgfbFtOP
	36jw==
MIME-Version: 1.0
Received: by 10.43.45.10 with SMTP id ui10mr2483385icb.32.1331291695995; Fri,
	09 Mar 2012 03:14:55 -0800 (PST)
Received: by 10.42.75.137 with HTTP; Fri, 9 Mar 2012 03:14:55 -0800 (PST)
In-Reply-To: <2ig0lhu1ti0mhyknnc4ow74t.1331291074225@email.android.com>
References: <2ig0lhu1ti0mhyknnc4ow74t.1331291074225@email.android.com>
Date: Fri, 9 Mar 2012 12:14:55 +0100
Message-ID: <CALbNGRT0fiiDj6c+5JUnyPv2M+w-sffJioD=NPOx8YcBRxRTag@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 5/6] cloud9: remove unneded systemd code
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
X-List-Received-Date: Fri, 09 Mar 2012 11:23:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 9, 2012 at 12:05 PM, Kridner, Jason <jdk@ti.com> wrote:
> How is it that the service to start the server running is unneeded?
>
The installations are done automatically by systemd.bbclass.

Andreas


