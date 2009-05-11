Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M3Yzd-0002YZ-RA
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 19:08:46 +0200
Received: (qmail 30943 invoked from network); 11 May 2009 17:02:12 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 11 May 2009 10:02:12 -0700
Date: Mon, 11 May 2009 10:02:12 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090511170212.GD7973@smtp.west.cox.net>
References: <1242058903-17716-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1242058903-17716-1-git-send-email-denis@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [STABLE][PATCH] curl: move PACKAGES and FILES_* from the	.inc file
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
X-List-Received-Date: Mon, 11 May 2009 17:08:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2009 at 12:21:43PM -0400, Denys Dmytriyenko wrote:

> this resolves the lockfile() trying to access the wrong directory
> when building sdk version after target one was built
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> Acked-by: Tom Rini <trini@embeddedalley.com>

I'll ack this for stable/2009 as well.

-- 
Tom Rini


