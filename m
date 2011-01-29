Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PjBTv-0007CS-O8
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 15:08:51 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 8FB741D366C2; Sat, 29 Jan 2011 15:07:58 +0100 (CET)
Date: Sat, 29 Jan 2011 15:07:58 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110129140758.GM2466@ibawizard.net>
References: <1296220046-14636-1-git-send-email-sujak.marek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1296220046-14636-1-git-send-email-sujak.marek@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH v2] barebox: added recipe for barebox v 2010.10
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
X-List-Received-Date: Sat, 29 Jan 2011 14:08:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

sujak.marek <sujak.marek@gmail.com> [2011-01-28 14:07:26]:

> +DEFAULT_PREFERENCE = "-1"
> +
> +# Mark archs/machines that this kernel supports
> +DEFAULT_PREFERENCE = "-1"

Duplicate DP=-1 and you can drop the comment also, it's wrong anyway.

-- ynezz


