Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MPPYV-0001MN-2J
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 01:31:03 +0200
Received: from tamarin.localnet (unknown [92.116.133.186])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 866051B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 23:18:41 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jul 2009 01:17:31 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-2-generic; KDE/4.2.95; i686; ; )
References: <fce2a370907011121k3d082889xc6910fda9c21aee4@mail.gmail.com>
In-Reply-To: <fce2a370907011121k3d082889xc6910fda9c21aee4@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200907110117.32106.holger+oe@freyther.de>
Subject: Re: Qt4 recipes and sql drivers
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
X-List-Received-Date: Fri, 10 Jul 2009 23:31:04 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 01 July 2009 20:21:11 Ihar Hrachyshka wrote:
> Hello guys!
> For my work project, I need to use Qt with Postgres and possibly
> Sqlite.

Do you have a pg_config in your staging directory? For me the host pg_config is 
used and my QtE build started to fail?

z.





