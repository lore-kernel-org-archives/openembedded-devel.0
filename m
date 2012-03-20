Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jtobias@viaas.com>) id 1S9oVK-0001c5-1y
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 03:08:54 +0100
Received: by lagw12 with SMTP id w12so5343107lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 19:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=nO1SN18W0fo0Z7zmtVzHngKpDeb+KiSSIs+hJ6Cc3PM=;
	b=QfileMkMeCTWE1QmL/ZAOq/0e/eTPZcGAkInT71YXj99IZt9rRD8u9ius89bzzFCHr
	kHc4tVE8AAafQbi5NEJdac/lj9h7dxnkO1F4bU3qtfadl4R0S83bwO9N6iLTFbN0pU19
	DXscu82SYuSplehoOD99QGOGHpeVSAQaYkCFQs/f2f2lY/RU1BaHBMkk00EGQA0Q9JA8
	cse6gAPxVo+u1rZS/iiHYhF3YsLnUX6O9GxDRT70Jc18moPSwOuUku5gnsY2aH2DZjkN
	9y23aKEdprwfklzwAMsaYU68TqUZ+J52rympKyLIB3vLIKlOj9ven461ER2kMLFWn/Fy
	6mcA==
MIME-Version: 1.0
Received: by 10.112.11.9 with SMTP id m9mr5098168lbb.60.1332208801838; Mon, 19
	Mar 2012 19:00:01 -0700 (PDT)
Received: by 10.112.68.75 with HTTP; Mon, 19 Mar 2012 19:00:01 -0700 (PDT)
Date: Mon, 19 Mar 2012 19:00:01 -0700
Message-ID: <CAJfOToXzfR=k1scimzw-dS_Wsmcqp15c=_iT=QFG_XFXa=ktzw@mail.gmail.com>
From: John Tobias <jtobias@viaas.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQknxaelNkpIkOtnUEnJeHB/wcpRzYg5sKC5XUJPtUYqU/+rzl/JWgERiB8wXa4wqi1U2slG
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Failing SD Card
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
X-List-Received-Date: Tue, 20 Mar 2012 02:08:54 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Is there anyone encountered the following errors in your sd card?.

Thanks,

john

EXT3-fs error (device mmcblk0p1): ext3_free_blocks: Freeing blocks in
system zones - Block = 256, count = 1
Aborting journal on device mmcblk0p1.
ext3_free_blocks_sb: aborting transaction: Journal has aborted in
__ext3_journal_get_undo_access<2>EXT3-fs error (device mmcblk0p1) in
ext3_free_blocks_sb: Journal has aborted
ext3_free_blocks_sb: aborting transaction: Journal has aborted in
__ext3_journal_get_undo_access<2>EXT3-fs error (device mmcblk0p1) in
ext3_free_blocks_sb: Journal has aborted
ext3_reserve_inode_write: aborting transaction: Journal has aborted in
__ext3_journal_get_write_access<2>EXT3-fs error (device mmcblk0p1) in
ext3_reserve_inode_write: Journal has aborted
EXT3-fs error (device mmcblk0p1) in ext3_truncate: Journal has aborted
ext3_reserve_inode_write: aborting transaction: Journal has aborted in
__ext3_journal_get_write_access<2>EXT3-fs error (device mmcblk0p1) in
ext3_reserve_inode_write: Journal has aborted
EXT3-fs error (device mmcblk0p1) in ext3_orphan_del: Journal has aborted
ext3_reserve_inode_write: aborting transaction: Journal has aborted in
__ext3_journal_get_write_access<2>ext3_abort called.
EXT3-fs error (device mmcblk0p1): ext3_journal_start_sb: Detected aborted
journal
Remounting filesystem read-only
EXT3-fs error (device mmcblk0p1) in ext3_reserve_inode_write: Journal has
aborted
EXT3-fs error (device mmcblk0p1) in ext3_delete_inode: Journal has aborted
__journal_remove_journal_head: freeing b_committed_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_committed_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_committed_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_frozen_data
__journal_remove_journal_head: freeing b_committed_data
__journal_remove_journal_head: freeing b_frozen_data

