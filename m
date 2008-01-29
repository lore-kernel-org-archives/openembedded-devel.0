Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JJmNg-00058k-GV
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2008 10:03:49 +0100
Received: by fk-out-0910.google.com with SMTP id 18so1585723fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2008 01:03:55 -0800 (PST)
Received: by 10.78.161.4 with SMTP id j4mr8904573hue.49.1201597435174;
	Tue, 29 Jan 2008 01:03:55 -0800 (PST)
Received: from widy.localdomain ( [88.231.77.184])
	by mx.google.com with ESMTPS id 16sm2567687hui.34.2008.01.29.01.03.53
	(version=SSLv3 cipher=OTHER); Tue, 29 Jan 2008 01:03:54 -0800 (PST)
Date: Tue, 29 Jan 2008 11:15:21 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080129111521.7f3c76de@widy.localdomain>
In-Reply-To: <20080129110934.3c3441da@widy.localdomain>
References: <E1JJdLv-000623-Uv@linuxtogo.org>
	<20080129110934.3c3441da@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev gcc-native-3.4.4: Add PROVIDES gcc-native3
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
X-List-Received-Date: Tue, 29 Jan 2008 09:03:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Jan 2008 11:09:34 +0200
Paul Sokolovsky <pmiscml@gmail.com> wrote:

> On Tue, 29 Jan 2008 00:25:23 +0100
> "rpurdie commit" <openembedded-commits@lists.openembedded.org> wrote:
> 
> > gcc-native-3.4.4: Add PROVIDES gcc-native3
> 
> gcc-native3?? How's that? ;-) Did you mean gcc3-native?
> 
> P.S.
> There're 0 occurrences of -native[0-9] pattern in the tree, but
> [0-9]-native gives bunch of hits like glib-2.0-native, libxml2-native,
> qmake2-native, uicmoc4-native, etc.

Aha, we have gcc-native.inc with:

PROVIDES = "gcc-native-${PV}" 

The worse then. And that's a bit different, still.


[]


