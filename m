Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 422 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Dec 2019 21:00:28 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id DCE0E7D19E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 21:00:28 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 0784B2803E2; Tue, 10 Dec 2019 13:04:07 -0800 (PST)
Date: Tue, 10 Dec 2019 13:04:06 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: Kamel Ghalgaoui <kamelghalgaoui7@gmail.com>
Message-ID: <20191210210406.ndlt2wt7w4rebmzq@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	Kamel Ghalgaoui <kamelghalgaoui7@gmail.com>,
	openembedded-devel@lists.openembedded.org,
	Andrey Zhizhikin <andrey.z@gmail.com>
References: <CANSQD5+CcEbaHxdfR8cjqdc6maXhrCgXy3eXrGD0dMgpiM_0LQ@mail.gmail.com>
	<7e5b400c-9c07-ff0d-df4b-9ca0329bfdbc@intel.com>
	<CANSQD5+e24bohovGjVgagiFrizqu2sj0SwzJWn+17tUJCthO_Q@mail.gmail.com>
	<CAHtQpK4zNtju4Own7yx+bTZsmyycW2dXoB0JOA=566X=h89wMw@mail.gmail.com>
	<20191210205704.wkwzy2kpgq2nqam2@vctlabs.com>
	<CANSQD5Ju4ZN7gW7GGm6ELdG63LQDAe-gbn1aFXK4oO1Ta5NhZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANSQD5Ju4ZN7gW7GGm6ELdG63LQDAe-gbn1aFXK4oO1Ta5NhZQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Building Linux Error
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
X-List-Received-Date: Tue, 10 Dec 2019 21:00:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


On Tue, Dec 10, 2019 at 09:57:01PM +0100, Kamel Ghalgaoui wrote:
> For information, I my kernel version is 5.3.11 and I have tar version: 1.26
> $ which tar
> /usr/local/bin/tar

Make sure you use system tar instead of whatever is lying in
/usr/local/bin and try again!

