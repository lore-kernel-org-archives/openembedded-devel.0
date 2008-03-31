Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JgMBv-0004tM-Qy
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 17:45:04 +0200
Received: by wx-out-0506.google.com with SMTP id h27so1918563wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 08:44:56 -0700 (PDT)
Received: by 10.100.122.8 with SMTP id u8mr16304711anc.46.1206978296835;
	Mon, 31 Mar 2008 08:44:56 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 31 Mar 2008 08:44:56 -0700 (PDT)
Message-ID: <c384c5ea0803310844l1e91faa0m86a699174afeabf7@mail.gmail.com>
Date: Mon, 31 Mar 2008 17:44:56 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200803310907.56781.e.robertson.svg@gmail.com>
MIME-Version: 1.0
References: <200803310907.56781.e.robertson.svg@gmail.com>
Subject: Re: New OE user question
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Mar 2008 15:45:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Mar 31, 2008 at 4:07 PM, E Robertson <e.robertson.svg@gmail.com> wrote:
> Hi All,
>
>  I'm brand new to OE and I've been following the documentation steps along the
>  way. I notice the documentation is either missing sections or not clear and

Good catch, our default example seems to be unmaintained.  Probably
the "generic" distribution lacks good maintenance, at least for this
configuration.

DISTRO         = "generic-uclibc"

The error which stops your build is:

>  | Unable to determine version for kernel headers
>  |       provided in

Can someone suggest a saner distribution for this Samsung chip? angstrom maybe?

Regards,
-- 
Leon


