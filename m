Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M7UbW-0004ln-Ue
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 15:16:07 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M7UU6-0005p0-57
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 14:08:26 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1M7UU6-0000iD-0D
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 14:08:26 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fce2a370905220555o3d234765y6fbeadb0c41629d3@mail.gmail.com>
References: <fce2a370905220555o3d234765y6fbeadb0c41629d3@mail.gmail.com>
Date: Fri, 22 May 2009 14:08:25 +0100
Message-Id: <1242997705.9080.347.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: New hal is not buildable (needs new blkid version)
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
X-List-Received-Date: Fri, 22 May 2009 13:16:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-05-22 at 15:55 +0300, Ihar Hrachyshka wrote:
> The problem is that the new hal was also set as preferred for
> angstrom distro. Please either add new e2fsprogs-libs or set
> hal-0.5.11 as preferred.

It's up to the angstrom distro maintainers to choose the preferred
versions that they want.  You should probably take this up with them on
their own mailing list rather than here.

p.




