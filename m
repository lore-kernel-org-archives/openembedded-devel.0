Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1IkeTw-0004h2-BH
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2007 13:33:04 +0200
Received: by wa-out-1112.google.com with SMTP id l24so205630waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2007 04:25:48 -0700 (PDT)
Received: by 10.115.59.4 with SMTP id m4mr562265wak.1193223690278;
	Wed, 24 Oct 2007 04:01:30 -0700 (PDT)
Received: by 10.114.254.11 with HTTP; Wed, 24 Oct 2007 04:01:30 -0700 (PDT)
Message-ID: <f96d234e0710240401o7fcdae32qc7d43ef162f38744@mail.gmail.com>
Date: Wed, 24 Oct 2007 07:01:30 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20071024095844.GA9952@lenovo>
MIME-Version: 1.0
References: <20071024095844.GA9952@lenovo>
Subject: Re: [doc] defining OpenEmbedded
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
X-List-Received-Date: Wed, 24 Oct 2007 11:33:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/24/07, David Farning <dfarning@gmail.com> wrote:
> Getting started is coming along nicely.

Great!

> In the second case referring to OE as a collection of metadata is
> confusing.  Metadata is data about the data.  OE is actually a
> collection of patches, task lists, and configuration files.  I was
> wondering if it would be more clear to refer to oe as either a ruleset
> or task lists.

The term metadistribution seems to be somewhat accepted:
http://gentoo-wiki.com/Metadistribution

In the most basic sense, a bitbake recipe is data about data (the
source that needs built), so I think the term fits. Just my opinion.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


