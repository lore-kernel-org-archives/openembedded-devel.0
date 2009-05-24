Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M8C3f-0004XB-KB
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 13:40:03 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M8Bw0-0007Zx-04
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 12:32:08 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
References: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
Date: Sun, 24 May 2009 12:32:02 +0100
Message-Id: <1243164722.4226.129.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Add gtksourceview 2.x and rename the 1.x tree recipe
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
X-List-Received-Date: Sun, 24 May 2009 11:40:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-05-14 at 10:14 +0200, Elena Grandi wrote:
> GtkSourceView[1] currently maintains a stable 2.x tree and an old stable
> 1.x tree for compatibility with older applications[2] and they can be
> installed together on a computer.
> 
> I need to add the recipe for the latest 2.x version, and since the old
> stable is used just in 2 recipes (gobby_0.4.1.bb and tea_17.3.5.bb) and
> mentioned as a preferred version in preferred-om-2008-versions.inc
> it seems to me that this could be a good time to rename it to
> gtksourceview1 with minimal breakage.

Is there really any need to rename the old one?  It seems like it would
be better just to leave the existing gtksourceview alone and add the new
one as gtksourceview2 or some such.

p.




