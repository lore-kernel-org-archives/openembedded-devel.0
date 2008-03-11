Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <halsbox.incoming@gmail.com>) id 1JZCM8-0004ih-5M
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 22:50:01 +0100
Received: by ug-out-1314.google.com with SMTP id i24so213175ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 14:47:56 -0700 (PDT)
Received: by 10.150.49.15 with SMTP id w15mr3970434ybw.32.1205272074996;
	Tue, 11 Mar 2008 14:47:54 -0700 (PDT)
Received: by 10.150.177.21 with HTTP; Tue, 11 Mar 2008 14:47:54 -0700 (PDT)
Message-ID: <62a02fda0803111447m43776e76ge22f854215394916@mail.gmail.com>
Date: Wed, 12 Mar 2008 00:47:54 +0300
From: "Hal tr" <halsbox.incoming@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <pan.2008.03.11.19.54.14@gmail.com>
MIME-Version: 1.0
References: <pan.2008.03.11.19.54.14@gmail.com>
X-SA-Exim-Connect-IP: 66.249.92.168
X-SA-Exim-Mail-From: halsbox.incoming@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=HTML_MESSAGE,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Cellwriter
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
X-List-Received-Date: Tue, 11 Mar 2008 21:50:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/3/11, Ken Bloom <kbloom@gmail.com>:
>
> I'm very surprised that CellWriter isn't in OpenEmbedded yet. This is a
> GPL handwriting recognition system that can be used on keyboardless
> systems, for example the Nokia 770, for input. Please add this if you
> can, and encourage distributions for keyboardless devices (e.g. Poky
> Linux, and Mamona) to include it in their images.


I'm using it  on my hx4700 with Angstrom, but my bitbake recipe includes
also a set of dirty patches to copy icons to proper place, to delete
terrible built in keyboard, to reformat the window layout for better screen
space usage and to add wmclass hint to manipulate the cellwriter window from
my wm (icewm) and much much more, hmm also it seems hicolor-icon-theme is
needed by cellwriter when it's running. So I think cellwriter as it is, is
not very usable without a lot of adaptations, imho.

