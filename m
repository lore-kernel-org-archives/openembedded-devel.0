Received: from [204.127.225.91] (helo=alnrmhc11.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <3rdshift@comcast.net>) id 1Gv3Xg-0002xs-PM
	for openembedded-devel@openembedded.org; Fri, 15 Dec 2006 04:15:24 +0100
Received: from dollar.3rdshift.com
	(c-69-251-178-175.hsd1.md.comcast.net[69.251.178.175])
	by comcast.net (alnrmhc11) with ESMTP
	id <20061215031334b1100k43pje>; Fri, 15 Dec 2006 03:13:35 +0000
Received: from dollar.3rdshift.com (localhost.localdomain [127.0.0.1])
	by dollar.3rdshift.com (8.13.7/8.13.6) with ESMTP id kBF3DYlw005611
	for <openembedded-devel@openembedded.org>;
	Thu, 14 Dec 2006 22:13:34 -0500
Received: (from vlg@localhost)
	by dollar.3rdshift.com (8.13.7/8.13.7/Submit) id kBF3DXZk005610
	for openembedded-devel@openembedded.org; Thu, 14 Dec 2006 22:13:33 -0500
From: VLG <3rdshift@comcast.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <432beae0612132324w36ad746bib4182c11f323072e@mail.gmail.com>
References: <1166066984.2740.21.camel@dollar.3rdshift.com>
	<432beae0612132324w36ad746bib4182c11f323072e@mail.gmail.com>
Organization: 3rdShift Inc.
Date: Thu, 14 Dec 2006 22:13:33 -0500
Message-Id: <1166152413.4156.2.camel@dollar.3rdshift.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 (2.6.3-1.fc5.5) 
Subject: Re: .bb file syntax question
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
X-List-Received-Date: Fri, 15 Dec 2006 03:15:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Justin,

thanks for the answer - that did the trick.

-Vlad

On Wed, 2006-12-13 at 23:24 -0800, Justin Patrin wrote:
> On 12/13/06, VLG <3rdshift@comcast.net> wrote:
> > Hi,
> >
> > I am looking for a working example of a .bb file that builds a .ipk
> > package by pulling project from Sourceforge-hosted CVS. Somehow, what I
> > tried so far for my project (http://granule.sf.net) simply doesn't work:
> >


