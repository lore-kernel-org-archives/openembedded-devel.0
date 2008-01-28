Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JJZXj-00044l-At
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 20:21:21 +0100
Received: from [192.168.1.105] (e180149035.adsl.alicedsl.de [85.180.149.35])
	by drlauer-research.com (Postfix) with ESMTP id CA500584BB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 20:25:02 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2008 20:21:27 +0100
User-Agent: KMail/1.9.7
References: <479D9AA9.8020704@student.utwente.nl>
	<479E2053.6090902@student.utwente.nl>
	<479E261E.1010903@balister.org>
In-Reply-To: <479E261E.1010903@balister.org>
MIME-Version: 1.0
Message-Id: <200801282021.27268.mickey@vanille-media.de>
Subject: Re: Renamed: Generic distro
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
X-List-Received-Date: Mon, 28 Jan 2008 19:21:21 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 28 January 2008 19:59:42 Philip Balister wrote:
> Koen Kooi wrote:
> > Besides not being named 'generic', what are the arguments against making
> > angstrom the 'generic' distro in OE? It's the closest thing of showing
> > off all features of OE *and* doing it the OE-way.
>
> At the risk of putting words in to Mickey's mouth, my view a generic
> distro is a generic.conf that contains the absolute minimum number of
> lines required to build an image successfully. Maybe we could call it
> minimal distro and remove generic?
>
> Angstrom has features, generic does not.
>
> The key is not to define the generic distro clearly and not let it
> feature creap towards Angstrom. (Kind of like minimal-image trying to
> get less minimal based on peoples viewpoint of what a minimal-image is)

Yes, this is the other major reason to keep generic. Yes, renaming it to 
minimal sounds good to me.

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


