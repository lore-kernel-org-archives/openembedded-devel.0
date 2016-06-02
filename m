Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id D44CF7746D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 18:58:56 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id EA46E2808CA; Thu,  2 Jun 2016 11:58:56 -0700 (PDT)
Date: Thu, 2 Jun 2016 11:58:56 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160602185856.GA7939@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
References: <20160602182426.GW7939@vctlabs.com>
	<20160602182801.GZ7939@vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20160602182801.GZ7939@vctlabs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-python][PATCHv3 3/3] python-tornado: add missing python2 runtime deps
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2016 18:58:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 02, 2016 at 11:28:01AM -0700, S. Lockwood-Childs wrote:
> +RDEPENDS_${PN} += "${PYTHON_PN}-backports-ssl ${PYTHON_P}-backports-abc ${PYTHON_PN}-singledispatch"

Well that's really fun -- I managed to pick the version of the patch with the
typo when splitting it up. Do I have to send the whole series again to add one
letter (PYTHON_P -> PYTHON_PN) ?

